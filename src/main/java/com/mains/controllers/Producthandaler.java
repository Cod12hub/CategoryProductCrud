package com.mains.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mains.bin.Category;
import com.mains.bin.Product;
import com.mains.repository.CategoryRepository;
import com.mains.repository.ProductRepository;

import java.util.List;


@Controller
@RequestMapping("/api/products")
public class Producthandaler {
	 @Autowired
	 private ProductRepository pro;
	 @Autowired
	    private CategoryRepository categoryrepo;




// 1. GET all products with pagination
@GetMapping
public String getAllProducts(@RequestParam(defaultValue = "0") int page, Model model) {
    Page<Product> products = pro.findAll(PageRequest.of(page, 5)); // Paginate by 10 items per page
    model.addAttribute("products", products.getContent());
    model.addAttribute("page", page);
    return "AllProduct"; // The view that displays the list of products

}




//Show the form to add a new product
@GetMapping("/newp")
public String showCreateProductForm(Model model) {
	List<Category> categories = categoryrepo.findAll(); // Get all categories
    model.addAttribute("categories", categories);
     model.addAttribute("product", new Product());
 // Empty product for the form
 return "addproduct";  // JSP for adding a product
}

// 2. POST - Create a new product
@PostMapping
public String createProduct(@ModelAttribute Product product,@RequestParam Long category_id) {
	Category category = categoryrepo.findById(category_id).orElse(null);

    if (category != null) {
        product.setCategory(category);  // Set th
    }
    pro.save(product);
    return "redirect:/api/products"; // Redirect to the product list
}


// 3. GET product by ID
@GetMapping("/{id}")
public String getProductById(@PathVariable Long id, Model model) {
    Product product = pro.findById(id).orElse(null);
    model.addAttribute("product", product);
    return "ProductDetails"; // The view that displays the product details
}

// 4. PUT - Update product by ID
@PostMapping("/{id}")
public String updateProduct(@PathVariable Long id, @ModelAttribute Product updatedProduct) {
    Product product = pro.findById(id).orElse(null);
    if (product != null) {
        product.setName(updatedProduct.getName());
        pro.save(product);
    }
    return "redirect:/api/products"; // Redirect to the product list
}

// Show form for updating an existing product
@GetMapping("/{id}/update")
public String showUpdateProductForm(@PathVariable("id") Long id, Model model) {
    Product product = pro.findById(id).orElse(null);
    model.addAttribute("product", product); // Pass the product to the form for editing
    return "UpdateProductjsp";  // Return the updateProduct.jsp page
}




// 5. DELETE - Delete product by ID
@DeleteMapping("/{id}")
public String deleteProduct(@PathVariable Long id) {
    pro.deleteById(id);
    return "redirect:/api/products"; // Redirect to the product list
}
}