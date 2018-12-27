package example.projectb;

import example.common.MessagePrinter;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class Main {

    public static void main(String... args) {
        SpringApplication.run(Main.class, args);
    }

    @Component
    public class AppStartupRunner implements ApplicationRunner {

        @Override
        public void run(ApplicationArguments args) throws Exception {
            MessagePrinter.print("Started Project B!");
        }
    }
}
