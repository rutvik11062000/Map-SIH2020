import java.util.*;

public class reverse{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the string to reverse : ");
        StringBuffer str = new StringBuffer();
        str.append(sc.nextLine());
        System.out.println("the given string is  " + str);
        str.reverse();
        System.out.println("The rfeverse String is :" + str);
        sc.close();
    }
}