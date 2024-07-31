import java.util.*;
public class Sorting_Customer_Orders{

    public static void main(String[] args) {
        Order[] orders = {
            new Order("O001", "Ram", 249.75),
            new Order("O002", "Bikash", 151.50),
            new Order("O003", "Chatur", 230.00),
            new Order("O004", "Dia", 290.00)
        };

        System.out.println("Original Orders:");
        for (Order order : orders) {
            System.out.println(order);
        }

        // Bubble Sort
        BubbleSort.bubbleSortByTotalPrice(orders);
        System.out.println("\nOrders Sorted by Bubble Sort:");
        for (Order order : orders) {
            System.out.println(order);
        }

        // Reinitialize orders
        orders = new Order[] {
            new Order("O001", "Ram", 249.75),
            new Order("O002", "Bikash", 151.50),
            new Order("O003", "Chatur", 230.00),
            new Order("O004", "Dia", 290.00)
        };

        // Quick Sort
        QuickSort.quickSortByTotalPrice(orders, 0, orders.length - 1);
        System.out.println("\nOrders Sorted by Quick Sort:");
        for (Order order : orders) {
            System.out.println(order);
        }

    }
}