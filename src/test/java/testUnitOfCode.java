import org.gradle.*;
import org.junit.Test;
import static org.junit.Assert.*;

public class MyUnitTest {

    @Test
    public void testAddition() {
        App.UnitOfCode myUnit = new App().new UnitOfCode();

        int result = myUnit.add5(4);

        // 4 + 5 should be 9
        assertEquals(9, result);

    }
}
