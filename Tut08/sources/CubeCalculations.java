//if (material < 1 || material > 3) {

import java.util.Scanner;

public class CubeCalculations {

    static Scanner IOTools = new Scanner(System.in);

    // material constants
    private static final int DENSITY_PLASTIC = 5;
    private static final int DENSITY_WOOD = 15;
    private static final int DENSITY_IRON = 25;
    private static final int DENSITY_PLUTONIUM = 10000;

    public static void main(String[] args) {
        printIntroduction();

        int length = getCubeLength();
        int density = getMaterialDensity();

        double volume = calculateVolume(length);
        double weight = calculateWeight(density, volume);
        double stiction = calculateStiction(weight);

        displayCubeProperties(length, weight, stiction);

        printOutro();
    }

    private static void printIntroduction() {
        System.out.println("Hello, test subject. Welcome to Aperture Science's computer-aided enrichment center.");
        System.out.println("Before we begin, we must configure your Aperture Science Weighted Storage Cube.");
    }

    private static int getCubeLength() {
        System.out.print("\nPlease input your desired length (in centimeters): ");
        return IOTools.nextInt();
    }

    private static int getMaterialDensity() {
        System.out.println("\nExcellent. Now, please choose a material for your cube.");
        System.out.println("  1 - Plastic");
        System.out.println("  2 - Wood");
        System.out.println("  3 - Iron");

        System.out.print("Awaiting selection...: ");
        int material = IOTools.nextInt();
        
        int density;
        
        switch (material) {
            case 1:
                density = DENSITY_PLASTIC; break;
            case 2:
                density = DENSITY_WOOD; break;
            case 3:
                density = DENSITY_IRON; break;
            default:
                density = DENSITY_PLUTONIUM; break;
        }

        if (material < 1 || material > 3) {
            System.out.println("\nThe Enrichment Center regrets to inform you that your selection is... impossible.");
            System.out.println("As a result, we have chosen Lead-coated Plutonium for you. It's terribly unsafe, but you're a test subject, not a survivor.");
        } else {
            System.out.println("\nThank you for your decision. Your Weighted Companion Cube is now being prepared.");
            System.out.println("You will find it remarkably helpful... or, at least, it will be useful until the end of the test.");
        }

        return density;
    }

    private static double calculateVolume(int lengthCm) {
        double lengthMeters = lengthCm / 100.0;
        return lengthMeters * lengthMeters * lengthMeters;
    }

    private static double calculateWeight(int density, double volume) {
        return density * volume;
    }

    private static double calculateStiction(double weight) {
        double gravity = 9.81;
        double stictionCoefficient = 1.0;
        double stiction = weight * gravity * stictionCoefficient;
        return stiction;
    }

    private static double roundToThreeDecimals(double value) {
        return (double) ((int) (value * 1000)) / 1000;
    }

    private static void displayCubeProperties(int length, double weight, double stiction) {
        weight = roundToThreeDecimals(weight);
        System.out.println("\n-----------------------------");
        System.out.println("Cube Dimensions: " + length + "x" + length + "x" + length + " cm^3");
        System.out.println("Cube Weight:     " + roundToThreeDecimals(weight) + " kg");
        System.out.println("Cube Stiction:   " + roundToThreeDecimals(stiction) + " kg");
        System.out.println("-----------------------------");
    }

    private static void printOutro() {
        System.out.println("\nPlease proceed to the chamberlock. And don't worry... you'll be fine... probably.");
    }
}
