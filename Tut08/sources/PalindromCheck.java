import java.util.Scanner;

public class PalindromCheck {

    static Scanner IOTools = new Scanner(System.in);

    public static void main(String[] args) {
        
        System.out.print("Geben Sie ein Wort ein: ");
        String inputWord = IOTools.nextLine();
        
        if (isPalindrome(inputWord)) {
            System.out.println("Der String \"" + inputWord + "\" ist ein Palindrom.");
        } else {
            System.out.println("Der String \"" + inputWord + "\" ist kein Palindrom.");
        }
    }

    public static boolean isPalindrome(String palindrome) {
        char[] letters = palindrome.toLowerCase().toCharArray();

        for (int i = 0; i < letters.length / 2; i++) {
            if (letters[i] != letters[length - 1 - i]) {
                return false; // return on first mismatch
            }
        }
        return true;
    }
}
