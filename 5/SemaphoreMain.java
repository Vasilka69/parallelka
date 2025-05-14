import java.util.*;
import java.util.concurrent.*;

public class SemaphoreMain {

    public static final int THREADS = 8;
    public static final int COUNT = 2;
    public static MySemaphore mySemaphore = new MySemaphore(COUNT);
    public static Semaphore regularSemaphore = new Semaphore(COUNT);

    public static void main(String[] args) throws InterruptedException {
        System.out.println("-------------------\nRegular semaphore:\n-------------------");
        runTask(regularSemaphore);
        System.out.println("--------------\nMy semaphore:\n--------------");
        runTask(mySemaphore);
    }

    private static void runTask(Semaphore semaphore) throws InterruptedException {
        ExecutorService es = Executors.newFixedThreadPool(THREADS);

        List<Callable<String>> tasks = new ArrayList<>();
        List<Future<String>> results = new ArrayList<>();

        for (int i = 0; i < THREADS; i++) {
            tasks.add(() -> {
                String threadName = Thread.currentThread().getName();
                boolean needDebug = semaphore.getClass().getSimpleName().equals("Semaphore");
                
                printDebug("Поток %s пытается захватить семафор".formatted(threadName), needDebug);
                semaphore.acquire();
                printDebug("Поток %s захватил семафор, доступно входов: %s".formatted(threadName, semaphore.availablePermits()), needDebug);

                System.out.println("Поток %s выполняет работу в критической секции".formatted(threadName));
                Thread.sleep(2000);

                printDebug("Поток %s пытается отпустить семафор".formatted(threadName), needDebug);
                semaphore.release();
                printDebug("Поток %s отпустил семафор, доступно входов: %s".formatted(threadName, semaphore.availablePermits()), needDebug);

                return "Thread " + threadName + " done";
            });
        }

        // invoke all the tasks
        try {
            results = es.invokeAll(tasks);
        } catch (InterruptedException ie) {
            ie.printStackTrace();
        }

        // shutdown executor service
        es.shutdown();
        es.awaitTermination(5, TimeUnit.SECONDS);
    }

    private static void printDebug(String message, boolean needDebug) {
        if (needDebug)
            System.out.println(message);
    }
}