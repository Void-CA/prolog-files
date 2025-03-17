ask_title :- 
    write('Enter the title of your favorite song: '),
    read(Title),  
    tell('music.txt'),
    write('Title: '),
    write(Title), nl,
    told.

join_letter :- 
    open('letra.txt', read, StreamRead),    % Abre letra.txt en modo lectura
    open('music.txt', append, StreamWrite), % Abre music.txt en modo append
    copiar_contenido(StreamRead, StreamWrite),
    close(StreamRead),  % Cierra letra.txt
    close(StreamWrite). % Cierra music.txt

copiar_contenido(StreamRead, StreamWrite) :- 
    get_code(StreamRead, C),
    (C \= -1 -> put_code(StreamWrite, C), copiar_contenido(StreamRead, StreamWrite) ; true).
