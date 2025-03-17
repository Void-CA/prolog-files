% 1. Intenta crear un archivo con al menos 5 miembros de tu familia y crea una regla
% para copiar su contenido a otro archivo.
% 2. Agrega código para mostrar el contenido de ese archivo en pantalla.
% 3. Intenta agregar nuevos miembros.
% 4. Muestra el contenido del fichero en pantalla.

% call back ejercicio 1
copy_file(File1, File2) :-
    see(File1),
    tell(File2),
    copy_lines,
    told,
    seen.

copy_lines :-
    read_line_to_string(current_input, Line),
    (   Line \= end_of_file
    ->  write_ln(Line),
        copy_lines
    ;   true
    ).
    
% callback
show_file(File) :-
    see(File),
    write('Contenido del archivo:'), nl,
    read_lines,
    seen.

read_lines :-
    read_line_to_string(current_input, Line),
    (   Line \= end_of_file
    ->  writeln(Line),
        read_lines
    ;   true
    ).


append_to_file(File) :-
    write_ln('Añade un miembro de tu familia: '),
    read(Content),
    see(File),
    tell(File),
    copy_lines,
    write_ln(Content),
    told,
    seen.
