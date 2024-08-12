package hooks;

import config_Requirements.ConfigReader;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.specification.RequestSpecification;

public class HooksAPI {
    public static RequestSpecification spec;

    @Before
    public void setUp() {
        spec = new RequestSpecBuilder()
                .setBaseUri(ConfigReader.getProperty("base_url", "api"))
                .build();
    }

    @After
    public void tearDownScenarios(Scenario scenario) {
        if (scenario.isFailed()) {  // Senaryo başarısız olursa
            logFailure(scenario);
        }
    }

    private void logFailure(Scenario scenario) {
        String scenarioName = scenario.getName();
        String scenarioUri = scenario.getUri().toString();
        String scenarioStatus = scenario.getStatus().name();

        // Kendi loglama method'unu kullanarak bilgileri yazdırma
        System.out.println("Senaryo Adi: " + scenarioName);
        System.out.println("URI: " + scenarioUri);
        System.out.println("Durum: " + scenarioStatus);
    }
}


