package com.shopping.blog.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.shopping.blog.model.Category;
import com.shopping.blog.model.Post;

import java.util.List;
import java.util.Optional;


@Component
public interface CategoryRepository extends JpaRepository<Category, Long> {

    public default List<Category> findAll() {
        return null;
    }

    public default Optional<Category> findById(Long id) {
        return null;
    }

    /* List<Post> findByCategory(Category category); */
}
