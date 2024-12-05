public class HexStringConverter {

    public static void main(String[] args) {

        char[] validChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

        System.out.print("Gültige Zeichen: ");
        for (char c : validChars) {
            System.out.print(c + ", ");
        }
        System.out.println();

        String input = args[0].toLowerCase();
        char[] hexArray = input.toCharArray();

        if (!isValidHexArray(hexArray, validChars))
            System.out.println("Der String " + input + " ist kein gültiger Hex-String.");
        else {
            long decimalValue = hexToDecimal(hexArray, validChars);
            /**
            long decimalValue = hexToDecimalWithChars(hexArray);
             */
            System.out.println("Der Dezimalwert des Hex-Strings " + input + " ist: " + decimalValue);
        }
    }

    public static boolean isValidHexArray(char[] hexArray, char[] validChars) {
        for (char c : hexArray) {
            if (!isValidHexChar(c, validChars)) return false;
        }
        return true;
    }

    public static boolean isValidHexChar(char c, char[] validChars) {
        for (char validChar : validChars) {
            if (c == validChar) return true;
        }
        return false;
    }

    public static long hexToDecimal(char[] hexArray, char[] validChars) {
        long result = 0;
        int length = hexArray.length;
        for (int i = 0; i < length; i++) {
            int hexValue = findHexValue(hexArray[i], validChars);
            result += hexValue * Math.pow(16, length - 1 - i);
        }
        return result;
    }

    public static int findHexValue(char hexChar, char[] validChars) {
        for (int i = 0; i < validChars.length; i++) {
            if (hexChar == validChars[i]) return i;
        }
        return -1;
    }

    public static long hexToDecimalWithChars(char[] hexArray) {
        long result = 0;
        for (char hexChar : hexArray) {
            int hexValue = getHexValue(hexChar);
            result = result * 16 + hexValue;
        }
        return result;
    }

    public static int getHexValue(char hexChar) {
        if (Character.isDigit(hexChar)) {
            return hexChar - '0';
        } else {
            return hexChar - 'a' + 10;
        }
    }
}
