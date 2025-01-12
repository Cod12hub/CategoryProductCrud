package com.mains.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;


import com.mains.bin.Category;
import com.mains.repository.CategoryRepository;

import java.util.List;

@Controller
@RequestMapping("/api/categories")




public class Handalers {
	 @Autowired
	    private CategoryRepository categoryrepo;
	
	 @RequestMapping("/")
	    public String view(Model model) {
		        model.addAttribute("categories", categoryrepo.findAll());
	        return "ShowCategory";
	    }




// Show form to create a category
@GetMapping("/new")
public String showCreateCategoryForm() {
    return "AddCategory";  
}

// Handle POST request to create a new category
@PostMapping
public String createCategory(@ModelAttribute Category category) {
    System.out.println("Category Name: " + category.getName()); 

    categoryrepo.save(category);
    return "redirect:/api/categories";  
}

@GetMapping
public String getAllCategories(Model model) {
    List<Category> categories = categoryrepo.findAll();  
    model.addAttribute("categories", categories);  
    return "ShowCategory";  
}


// GET category by ID
@GetMapping("/{id}")
public String getCategoryById( Long id, Model model) {
    Category category = categoryrepo.findById(id).orElse(null);
    model.addAttribute("category", category);
    return "ShowCategory";  
}


//GET method to show the update form
@GetMapping("/{id}/update")
public String showUpdateCategoryForm(@PathVariable("id") Long id, Model model) {
 Category category = categoryrepo.findById(id).orElse(null);
 model.addAttribute("category", category);
 return "CategoryUpdate";  
}

@PutMapping("/{id}")
public String updateCategory(@PathVariable("id") Long id, @ModelAttribute Category updatedCategory) {
    Category category = categoryrepo.findById(id).orElse(null);
    
    if (category != null) {
        category.setName(updatedCategory.getName());  
        categoryrepo.save(category);  
    }
    return "redirect:/api/categories";  
}
@DeleteMapping("/{id}")
public String deleteCategory(@PathVariable Long id) {
    Category category = categoryrepo.findById(id).orElse(null);
    categoryrepo.delete(category);  
    return "redirect:/api/categories"; 
}






}