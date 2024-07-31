import java.util.*;
public class Library_Management_System{
    public static void main(String[] args) {
        Book[] books = {
            new Book("B001", "Three Mistakes of My Life", "Chetan Bhagat"),
            new Book("B002", "I Too Had a Love Story", "Ravindra Jain"),
            new Book("B003", "The Discovery of India", "Pt. J N Nehru")
        };

        // Linear Search
        System.out.println("Linear Search:");
        Book book = BookSearch.linearSearchByTitle(books, "1984");
        if (book != null) {
            System.out.println("Found: " + book);
        } else {
            System.out.println("Book not found.");
        }

        // Binary Search (assuming books are sorted by title)
        System.out.println("\nBinary Search:");
        Book[] sortedBooks = {
            new Book("B001", "Three Mistakes of My Life", "Chetan Bhagat"),
            new Book("B002", "I Too Had a Love Story", "Ravindra Jain"),
            new Book("B003", "The Discovery of India", "Pt. J N Nehru")
        };
        book = BookSearch.binarySearchByTitle(sortedBooks, "I Too Had a Love Story");
        if (book != null) {
            System.out.println("Found: " + book);
        } else {
            System.out.println("Book not found.");
        }
    }
}
