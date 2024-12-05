import java.io.BufferedWriter;
import java.io.IOException;
import java.util.Map;

%%

%public
%class Lexerclass
%unicode
%standalone

%{
private BufferedWriter writer;
private int lineNumber = 1; // Contador de líneas
private int columnNumber = 1; // Contador de columnas
private int cont = 0; // Contador de tokens procesados

private static final Map<String, String> palabrasReservadas = Map.ofEntries(
    Map.entry("MOVE_FORWARD", "MOVE_FORWARD"),
    Map.entry("MOVE_BACKWARD", "MOVE_BACKWARD"),
    Map.entry("TURN_LEFT", "TURN_LEFT"),
    Map.entry("TURN_RIGHT", "TURN_RIGHT"),
    Map.entry("TURN_UP", "SUBIR"),
    Map.entry("TURN_DOWN", "BAJAR"),
    Map.entry("MOVE_TO", "MOVER_A"),
    Map.entry("ROTATE", "ROTAR"),
    Map.entry("STOP", "STOP"),
    Map.entry("STOP_IMMEDIATELY", "DETENER_INMEDIATAMENTE"),
    Map.entry("REVERSE", "INVERTIR"),
    Map.entry("WAIT", "ESPERAR"),
    Map.entry("INCREASE_SPEED", "AUMENTAR_VELOCIDAD"),
    Map.entry("DECREASE_SPEED", "DISMINUIR_VELOCIDAD"),
    Map.entry("SET_SPEED", "ESTABLECER_VELOCIDAD"),
    Map.entry("READ_SENSOR", "READ_SENSOR"),
    Map.entry("ACTIVATE_SENSOR", "ACTIVATE_SENSOR"),
    Map.entry("DEACTIVATE_SENSOR", "DEACTIVATE_SENSOR"),
    Map.entry("START", "START"),
    Map.entry("SHUTDOWN", "SHUTDOWN"),
    Map.entry("PAUSE", "PAUSE"),
    Map.entry("RESUME", "RESUME"),
    Map.entry("INIT", "INICIALIZAR"),
    Map.entry("RESET", "REINICIAR"),
    Map.entry("REBOOT", "REARRANCAR"),
    Map.entry("CALIBRATE", "CALIBRAR"),
    Map.entry("SHUT_OFF", "APAGAR_COMPLETAMENTE"),
    Map.entry("ACTIVATE_ALARM", "ACTIVAR_ALARMA"),
    Map.entry("DEACTIVATE_ALARM", "DESACTIVAR_ALARMA"),
    Map.entry("CHECK_BATTERY", "VERIFICAR_BATERIA"),
    Map.entry("CHARGE_BATTERY", "CARGAR_BATERIA"),
    Map.entry("LOW_BATTERY", "BATERIA_BAJA"),
    Map.entry("IF", "IF"),
    Map.entry("THEN", "THEN"),
    Map.entry("ELSE", "ELSE"),
    Map.entry("WHILE", "WHILE"),
    Map.entry("FOR", "FOR"),
    Map.entry("BREAK", "INTERRUMPIR"),
    Map.entry("CONTINUE", "CONTINUAR"),
    Map.entry("UPLOAD_FILE", "SUBIR_ARCHIVO"),
    Map.entry("DELETE_FILE", "ELIMINAR_ARCHIVO"),
    Map.entry("COPY_FILE", "COPIAR_ARCHIVO"),
    Map.entry("RENAME_FILE", "RENOMBRAR_ARCHIVO"),
    Map.entry("SAVE_FILE", "GUARDAR_ARCHIVO"),
    Map.entry("LOG", "REGISTRAR"),
    Map.entry("PRINT", "IMPRIMIR"),
    Map.entry("SCAN", "ESCANEAR"),
    Map.entry("UPLOAD", "SUBIR"),
    Map.entry("DOWNLOAD", "DESCARGAR"),
    Map.entry("TRUE", "VERDADERO"),
    Map.entry("FALSE", "FALSO"),
    Map.entry("NULL", "NULO"),
    Map.entry("OPEN_DOOR", "ABRIR_PUERTA"),
    Map.entry("CLOSE_DOOR", "CERRAR_PUERTA"),
    Map.entry("UNLOCK", "DESBLOQUEAR"),
    Map.entry("LOCK", "BLOQUEAR"),
    Map.entry("TOGGLE_LIGHT", "INTERRUMPIR_LUZ")
);


public boolean isEOF() {
    return zzAtEOF;
}

public Lexerclass(Reader in, BufferedWriter writer) {
    this.zzReader = in;
    this.writer = writer;
}

// Escribe un token en el archivo de salida
private void escribeToken(String tipo, String lexema) {
    try {
        writer.write(cont + ": (" + tipo + ", \"" + lexema + "\") en línea " + lineNumber + ", columna " + columnNumber + "\n");
        columnNumber += yytext().length(); // Actualiza la columna según el tamaño del lexema
        cont++;
    } catch (IOException e) {
        e.printStackTrace();
    }
}

// Reporta un error en el archivo de salida
private void reportaError(String lexema, String mensaje) {
    try {
        writer.write(cont + ": ERROR: Línea " + lineNumber + ", Columna " + columnNumber + ": " + mensaje + " '" + lexema + "'\n");
        columnNumber += lexema.length(); // Actualiza la columna
        cont++;
    } catch (IOException e) {
        e.printStackTrace();
    }
}
%}

OPEN_PAREN = "\("
CLOSE_PAREN = "\)"
OPEN_BRACE = "\{"
CLOSE_BRACE = "\}"
SEMICOLON = ";"
COLON = ":"
COMMA = ","
ESPACIO=[ \t\r]+
%%

// Ignorar espacios y saltos de línea
{ESPACIO}                { columnNumber += yylength(); /* Ignorar espacios */ }
\n                   { lineNumber++; columnNumber = 1; }

// Palabras reservadas
"IF"                { escribeToken("PALABRA_RESERVADA", yytext()); }
"ELSE"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"THEN"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"MOVE_FORWARD"      { escribeToken("PALABRA_RESERVADA", yytext()); }
"MOVE_BACKWARD"     { escribeToken("PALABRA_RESERVADA", yytext()); }
"TURN_LEFT"         { escribeToken("PALABRA_RESERVADA", yytext()); }
"TURN_RIGHT"        { escribeToken("PALABRA_RESERVADA", yytext()); }
"STOP"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"END"               { escribeToken("PALABRA_RESERVADA", yytext()); }
"TURN_UP"           { escribeToken("PALABRA_RESERVADA", yytext()); }
"TURN_DOWN"         { escribeToken("PALABRA_RESERVADA", yytext()); }
"MOVE_TO"           { escribeToken("PALABRA_RESERVADA", yytext()); }
"ROTATE"            { escribeToken("PALABRA_RESERVADA", yytext()); }
"STOP_IMMEDIATELY"  { escribeToken("PALABRA_RESERVADA", yytext()); }
"REVERSE"           { escribeToken("PALABRA_RESERVADA", yytext()); }
"WAIT"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"INCREASE_SPEED"    { escribeToken("PALABRA_RESERVADA", yytext()); }
"DECREASE_SPEED"    { escribeToken("PALABRA_RESERVADA", yytext()); }
"SET_SPEED"         { escribeToken("PALABRA_RESERVADA", yytext()); }
"READ_SENSOR"       { escribeToken("PALABRA_RESERVADA", yytext()); }
"ACTIVATE_SENSOR"   { escribeToken("PALABRA_RESERVADA", yytext()); }
"DEACTIVATE_SENSOR" { escribeToken("PALABRA_RESERVADA", yytext()); }
"START"             { escribeToken("PALABRA_RESERVADA", yytext()); }
"SHUTDOWN"          { escribeToken("PALABRA_RESERVADA", yytext()); }
"PAUSE"             { escribeToken("PALABRA_RESERVADA", yytext()); }
"RESUME"            { escribeToken("PALABRA_RESERVADA", yytext()); }
"INIT"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"RESET"             { escribeToken("PALABRA_RESERVADA", yytext()); }
"REBOOT"            { escribeToken("PALABRA_RESERVADA", yytext()); }
"CALIBRATE"         { escribeToken("PALABRA_RESERVADA", yytext()); }
"SHUT_OFF"          { escribeToken("PALABRA_RESERVADA", yytext()); }
"ACTIVATE_ALARM"    { escribeToken("PALABRA_RESERVADA", yytext()); }
"DEACTIVATE_ALARM"  { escribeToken("PALABRA_RESERVADA", yytext()); }
"CHECK_BATTERY"     { escribeToken("PALABRA_RESERVADA", yytext()); }
"CHARGE_BATTERY"    { escribeToken("PALABRA_RESERVADA", yytext()); }
"LOW_BATTERY"       { escribeToken("PALABRA_RESERVADA", yytext()); }
"WHILE"             { escribeToken("PALABRA_RESERVADA", yytext()); }
"FOR"               { escribeToken("PALABRA_RESERVADA", yytext()); }
"BREAK"             { escribeToken("PALABRA_RESERVADA", yytext()); }
"CONTINUE"          { escribeToken("PALABRA_RESERVADA", yytext()); }
"UPLOAD_FILE"       { escribeToken("PALABRA_RESERVADA", yytext()); }
"DELETE_FILE"       { escribeToken("PALABRA_RESERVADA", yytext()); }
"COPY_FILE"         { escribeToken("PALABRA_RESERVADA", yytext()); }
"RENAME_FILE"       { escribeToken("PALABRA_RESERVADA", yytext()); }
"SAVE_FILE"         { escribeToken("PALABRA_RESERVADA", yytext()); }
"LOG"               { escribeToken("PALABRA_RESERVADA", yytext()); }
"PRINT"             { escribeToken("PALABRA_RESERVADA", yytext()); }
"SCAN"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"UPLOAD"            { escribeToken("PALABRA_RESERVADA", yytext()); }
"DOWNLOAD"          { escribeToken("PALABRA_RESERVADA", yytext()); }
"TRUE"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"FALSE"             { escribeToken("PALABRA_RESERVADA", yytext()); }
"NULL"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"OPEN_DOOR"         { escribeToken("PALABRA_RESERVADA", yytext()); }
"CLOSE_DOOR"        { escribeToken("PALABRA_RESERVADA", yytext()); }
"UNLOCK"            { escribeToken("PALABRA_RESERVADA", yytext()); }
"LOCK"              { escribeToken("PALABRA_RESERVADA", yytext()); }
"TOGGLE_LIGHT"      { escribeToken("PALABRA_RESERVADA", yytext()); }


// Identificadores y números
[a-zA-Z_][a-zA-Z0-9_]* {
    if (palabrasReservadas.containsKey(yytext())) {
        escribeToken(palabrasReservadas.get(yytext()), yytext());
    } else {
        escribeToken("IDENTIFICADOR", yytext());
    }
}
[0-9]+                { escribeToken("NUMERO", yytext()); }
[0-9]+\.[0-9]+        { escribeToken("NUMERO", yytext()); }

// Operadores
"="                  { escribeToken("OPERADOR_ASIGNACION", yytext()); }
"\+"                { escribeToken("OPERADOR_ARITMETICO", yytext()); }
"-"                  { escribeToken("OPERADOR_ARITMETICO", yytext()); }
"\\*"                { escribeToken("OPERADOR_ARITMETICO", yytext()); }
"/"                  { escribeToken("OPERADOR_ARITMETICO", yytext()); }
">"                  { escribeToken("OPERADOR_RELACIONAL", yytext()); }
"<"                  { escribeToken("OPERADOR_RELACIONAL", yytext()); }
"=="                 { escribeToken("OPERADOR_RELACIONAL", yytext()); }
"!="                 { escribeToken("OPERADOR_RELACIONAL", yytext()); }

// Delimitadores
{OPEN_PAREN}           { escribeToken(yytext(), "PARENTESIS_ABIERTO"); }
{CLOSE_PAREN}          { escribeToken(yytext(), "PARENTESIS_CERRADO"); }
{OPEN_BRACE}           { escribeToken(yytext(), "LLAVE_ABIERTA"); }
{CLOSE_BRACE}          { escribeToken(yytext(), "LLAVE_CERRADA"); }
{SEMICOLON}            { escribeToken(yytext(), "PUNTO_Y_COMA"); }
{COLON}                { escribeToken(yytext(), "DOS_PUNTOS"); }
{COMMA}                { escribeToken(yytext(), "COMA"); }


// Manejo de errores
.                    { reportaError(yytext(), "Símbolo desconocido"); }
