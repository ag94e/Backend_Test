import junit.framework.TestCase;

public class CalculatorTest extends TestCase{
	
	private Calculator calculator;
	
	public void scenario() {
		calculator = new Calculator();
	}
	
	public void Testadd () {
		scenario();
		assertTrue(calculator.add(3,3)==(3+3));
	}
	
	public void Testsubstract () {
		scenario();
		assertTrue(calculator.substract(3,3)==(3-3));
	}
	
	public void Testmultiply () {
		scenario();
		assertTrue(calculator.multiply(3,3)==(3*3));
	}
	
	public void Testdivide () {
		scenario();
		assertTrue(calculator.divide(3,3)==(3/3));
	}

}