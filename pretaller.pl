%% Parte 1 – Hechos básicos

% Actividades generales
cocina(ana).
estudia(maria).
trabaja(juan).
juega(pedro).
descansa(sofia).

% Relaciones de amistad
amigo(ana, juan).
amigo(juan, maria).
amigo(pedro, sofia).

% Relaciones familiares
hermano(ana, pedro).
prima(maria, sofia).

% Rutinas semanales
rutina(ana, lunes, cocinar).
rutina(ana, martes, cocinar).
rutina(ana, miercoles, cocinar).
rutina(ana, jueves, cocinar).
rutina(ana, viernes, cocinar).
rutina(ana, sabado, cocinar).
rutina(ana, domingo, descansar).

rutina(juan, lunes, estudiar).
rutina(juan, martes, estudiar).
rutina(juan, miercoles, estudiar).
rutina(juan, jueves, estudiar).
rutina(juan, viernes, estudiar).
rutina(juan, sabado, descansar).
rutina(juan, domingo, descansar).

rutina(pedro, lunes, trabajar).
rutina(pedro, martes, trabajar).
rutina(pedro, miercoles, trabajar).
rutina(pedro, jueves, trabajar).
rutina(pedro, viernes, trabajar).
rutina(pedro, sabado, jugar).
rutina(pedro, domingo, descansar).

rutina(sofia, lunes, trabajar).
rutina(sofia, martes, trabajar).
rutina(sofia, miercoles, trabajar).
rutina(sofia, jueves, trabajar).
rutina(sofia, viernes, trabajar).
rutina(sofia, sabado, estudiar).
rutina(sofia, domingo, descansar).

rutina(maria, lunes, estudiar).
rutina(maria, martes, estudiar).
rutina(maria, miercoles, estudiar).
rutina(maria, jueves, estudiar).
rutina(maria, viernes, estudiar).
rutina(maria, sabado, estudiar).
rutina(maria, domingo, descansar).

%% Parte 2 – Reglas simples

actividad(X) :- cocina(X).
actividad(X) :- estudia(X).
actividad(X) :- trabaja(X).
actividad(X) :- juega(X).
actividad(X) :- descansa(X).

% Descansa si no tiene alguna actividad
descansa(X, Dia) :-
    \+ rutina(X, Dia, cocinar),
    \+ rutina(X, Dia, estudiar),
    \+ rutina(X, Dia, trabajar),
    \+ rutina(X, Dia, jugar).

% Parentesco directo
es_familia(X, Y) :- hermano(X, Y).
es_familia(X, Y) :- prima(X, Y).
es_familia(X, Y) :- hermano(Y, X).
es_familia(X, Y) :- prima(Y, X).

% Parte 3 – Reglas recursivas
% y Parte 6 - Explicaciones

% Amistad directa
es_amigo(X, Y) :- amigo(X, Y).
es_amigo(X, Y) :- amigo(Y, X).

% Regla recursiva amistad:
% - Caso base: si hay amistad directa (hecho amigo/2).
% - Caso general: X es amigo de Y si X es amigo de Z y Z es amigo de Y.

% Amistad indirecta
es_amigo(X, Y) :-
    amigo(X, Z),
    es_amigo(Z, Y),
    X \= Y.

% Miembro en lista
miembro(X, [X|_]).                
miembro(X, [_|T]) :- miembro(X, T). 

% Regla miembro:
% - Caso base: el elemento buscado es la cabeza de la lista.
% - Caso general: se busca en la cola de la lista.

% Invertir lista
invertir([], []).                
invertir([H|T], R) :- 
    invertir(T, RT),
    append(RT, [H], R).           

% Regla invertir:
% - Caso base: la lista vacía invertida es la lista vacía.
% - Caso general: se invierte la cola y se concatena la cabeza al final.

% Rutina por día
actividad(Persona, Dia, Act) :- rutina(Persona, Dia, Act).

%% Parte 5 – El personaje inventando
% TODO Luis es vecino de Juan, trabaja de repartidor y juega ajedrez
rutina(luis, lunes, trabajar).
rutina(luis, martes, trabajar).
rutina(luis, miercoles, trabajar).
rutina(luis, jueves, trabajar).
rutina(luis, viernes, trabajar).
rutina(luis, sabado, jugar).
rutina(luis, domingo, descansar).

vecino(luis, juan).

% REGLA EXTRA 
% quienes compartenn una actividad el mismo dia
comparten_actividad(X, Y, Dia, Act) :-
    rutina(X, Dia, Act),
    rutina(Y, Dia, Act).

% Modelado de rutinas:
% Se usaron hechos rutina(Persona, Dia, Actividad) para describir lo que cada
% personaje hace según el día de la semana. Esto permite consultas directas
% como "¿qué hace alguien en un día dado?" o reglas más complejas como
% "comparten_actividad".