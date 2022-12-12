package com.pluralsight.blog.data;

import com.pluralsight.blog.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

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
}
