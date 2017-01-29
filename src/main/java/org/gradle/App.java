package org.gradle;

public class App{
    public static void main(String[] args){
        System.out.println("hello world");
        new App().new Thing().doSomething();
        int result = new App().new UnitOfCode().add5(3);
        System.out.println(result);
    }

    private class Thing{
      public void doSomething(){
        for(int i = 0; i < 5; i++)
          System.out.println("doing something");
      }
    }

    private class UnitOfCode{
        public UnitOfCode(){}
          public int add5(int x){
            return x + 5;
          }
    }
}
