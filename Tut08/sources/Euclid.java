import java.util.Scanner;

public class Euclid {

    static Scanner IOTools = new Scanner(System.in);

    public static void main(String[] args) {
        // Einlesen wie in Aufgabe angegeben:
        System.out.print("m: ");
        int m = IOTools.nextInt();
        System.out.print("n: ");
        int n = IOTools.nextInt();

        // Test auf negative Zahlen:
        if (m < 0 || n < 0) System.out.println("Nicht-negative Zahlen erwartet!");
        else {
            int result = calculateGCD(m, n);
            System.out.println("Der ggT von lautet: " + result);
        }
    }

    // Aus Pseudocode übernommener Algorithmus:
    private static int calculateGCD(int m, int n) {
        if (m == 0) return n;
        while (n != 0) {
            if (m > n) m = m - n;
            else n = n - m;
        }
        return m;
    }
}
