class LinearSearch {
    public static Product linearSearchById(Product[] products, String productId) {
        for (Product product : products) {
            if (product.getProductId().equals(productId)) {
                return product;
            }
        }
        return null;
    }

    public static Product linearSearchByName(Product[] products, String productName) {
        for (Product product : products) {
            if (product.getProductName().equals(productName)) {
                return product;
            }
        }
        return null;
    }

    public static Product linearSearchByCategory(Product[] products, String category) {
        for (Product product : products) {
            if (product.getCategory().equals(category)) {
                return product;
            }
        }
        return null;
    }
}