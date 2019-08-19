package githubTest;

public class BookWarmMain {
	public static void main(String[] args) {
		Calculator cal = new CalculatorImpl();
		System.out.println("Main");
		System.out.println(cal.add(336, 6));
		System.out.println(cal.div(336, 6));
		System.out.println(cal.mul(336, 6));
		System.out.println(cal.mod(336, 6));
		System.out.println(cal.min(336, 6));
		// 현재 마스터로 머지했습니다.
	}
}
