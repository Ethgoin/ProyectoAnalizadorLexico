import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;

public class App {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Uso: java App <archivo_entrada> <archivo_salida>");
            return;
        }

        String archivoEntrada = args[0];
        String archivoSalida = args[1];

        try (
            Reader reader = new FileReader(archivoEntrada);
            BufferedWriter writer = new BufferedWriter(new FileWriter(archivoSalida))
        ) {
            Lexerclass lexer = new Lexerclass(reader, writer);

            System.out.println("Iniciando análisis léxico...");
            while (!lexer.isEOF()) {
                lexer.yylex();
            }
            System.out.println("Análisis léxico completado. Revisa el archivo '" + archivoSalida + "' para los resultados.");
        } catch (IOException e) {
            System.err.println("Error procesando los archivos: " + e.getMessage());
        }
    }
}