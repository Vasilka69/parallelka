import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class MySemaphore extends Semaphore {

    private int permits;
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition permitsAvailable = lock.newCondition();

    public MySemaphore(int initialPermits) {
        super(initialPermits);
        lock.lock();
        try {
            permits = initialPermits;
        } finally {
            lock.unlock();
        }
    }

    @Override
    public void acquire() throws InterruptedException {
        lock.lock();
        try {
            System.out.println("[MySemaphore] Поток %s пытается захватить семафор, доступно входов: %s".formatted(Thread.currentThread().getName(), permits));
            if (permits == 0) {
                System.out.println("[MySemaphore] Поток %s ожидает освобождения семафора, доступно входов: %s".formatted(Thread.currentThread().getName(), permits));
                permitsAvailable.await();
            }
            permits--;
            System.out.println("[MySemaphore] Поток %s захватил семафор, доступно входов: %s".formatted(Thread.currentThread().getName(), permits));
        } finally {
            lock.unlock();
        }
    }

    @Override
    public void release() {
        lock.lock();
        try {
            permits++;
            System.out.println("[MySemaphore] Поток %s отпустил семафор, доступно входов: %s".formatted(Thread.currentThread().getName(), permits));
            permitsAvailable.signal();
        } finally {
            lock.unlock();
        }
    }

    @Override
    public int availablePermits() {
        return permits;
    }
}