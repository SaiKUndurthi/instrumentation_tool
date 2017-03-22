package aspectj;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;

@Aspect
public class TestAspect {

/*   @Before("execution(* *(..))")
     public void before(JoinPoint jp) throws Throwable{
         Signature signature = jp.getSignature();
         String fieldName = signature.getName();
         System.out.println("Before calling method " + fieldName);
     }
*/
 @Before("execution (* android.widget..*(..))")
    public void adviceEnter(JoinPoint joinPoint) {
        System.out.printf("Enter method:   '%s'%n", joinPoint);
    }

 @After("execution (* android.widget..*(..))")
    public void adviceExit(JoinPoint joinPoint) {
        System.out.printf("Exit method:   '%s'%n", joinPoint);
    }

}
