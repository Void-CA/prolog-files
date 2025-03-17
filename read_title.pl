ask_title :-
    write('Enter the title of your favorite song: '),
    read_line_to_string(user_input, Title), 
    tell('music.txt'),
    write('Title: '),
    write(Title), nl,
    told.

join_letter :- 
    open('letra.txt', read, StreamRead),    % Abre letra.txt en modo lectura
    open('music.txt', append, StreamWrite), % Abre music.txt en modo append
    copiar_contenido(StreamRead, StreamWrite),
    close(StreamRead),  % Cierra letra.txt
    write('Enter the author of your favorite song: '),
    read_line_to_string(user_input, Author), 
    write(StreamWrite, '\n\nAuthor: '),  % Escribe en el archivo
    write(StreamWrite, Author), 
    nl(StreamWrite), 
    close(StreamWrite). % Cierra music.txt
    

copiar_contenido(StreamRead, StreamWrite) :- 
    get_code(StreamRead, C),
    (C \= -1 -> put_code(StreamWrite, C), copiar_contenido(StreamRead, StreamWrite) ; true).

mostrar :-
    open('music.txt', read, Stream),  % Abre el archivo en modo lectura
    mostrar_contenido(Stream),        
    close(Stream).                    % Cierra el archivo después de leer

mostrar_contenido(Stream) :-
    read_line_to_string(Stream, Line),  % Lee cada línea como una cadena de texto
    (   Line == end_of_file    
    ->  true
    ;   write(Line), nl,        
        mostrar_contenido(Stream) % Llama nuevamente para leer la siguiente línea
    ).
    
    

