public class Ecommerce_Platform_Search_Function{
    public static void main(String[] args) {
    	Product[] products = {
            new Product("P001", "Earbud", "Electronics"),
            new Product("P002", "Smartphone", "Electronics"),
            new Product("P004", "Keyboard", "Accessories"),
            new Product("P003", "Laptop", "Electronics"),
            new Product("P005", "Charger", "Accessories")
        };

        // Linear Search
        System.out.println("Linear Search by ID: " + LinearSearch.linearSearchById(products, "P003"));
        System.out.println("Linear Search by Name: " + LinearSearch.linearSearchByName(products, "Earbud"));
        System.out.println("Linear Search by Category: " + LinearSearch.linearSearchByCategory(products, "Accessories"));

        // Binary Search
        System.out.println("Binary Search by ID: " + BinarySearch.binarySearchById(products, "P003"));
        System.out.println("Binary Search by Name: " + BinarySearch.binarySearchByName(products, "Earbud"));
        System.out.println("Binary Search by Category: " + BinarySearch.binarySearchByCategory(products, "Accessories"));
    }
}
