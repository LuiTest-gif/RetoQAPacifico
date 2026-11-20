package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

class UsersTest {

    @Test
    void testUsers() {

        Results results = Runner.path("classpath:features/usuarios")
                .parallel(1);
    }

}