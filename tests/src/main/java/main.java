import java.util.List;

public class main {

    public static void main(String[] args) {
        System.out.println(testing(""));


    }

    public static List<String> testing(String test){
        return List.of(test.split(" "));

    };
}
