package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class ReviewDAO extends DBUtils {
    
    public List<ReviewDTO> getAllReviews() {
        List<ReviewDTO> reviews = new ArrayList<>();
        String query = "SELECT * FROM tblReviews";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ReviewDTO review = new ReviewDTO(
                        resultSet.getString("reviewID"),
                        resultSet.getString("userID"),
                        resultSet.getString("serviceID"),
                        resultSet.getInt("rating"),
                        resultSet.getString("comments")
                );
                reviews.add(review);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return reviews;
    }

    public ReviewDTO getReviewById(String reviewID) {
        String query = "SELECT * FROM tblReviews WHERE reviewID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, reviewID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new ReviewDTO(
                        resultSet.getString("reviewID"),
                        resultSet.getString("userID"),
                        resultSet.getString("serviceID"),
                        resultSet.getInt("rating"),
                        resultSet.getString("comments")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean createReview(ReviewDTO review) {
        String query = "INSERT INTO tblReviews (reviewID, userID, serviceID, rating, comments) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, review.getReviewID());
            statement.setString(2, review.getUserID());
            statement.setString(3, review.getServiceID());
            statement.setInt(4, review.getRating());
            statement.setString(5, review.getComments());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateReview(ReviewDTO review) {
        String query = "UPDATE tblReviews SET userID = ?, serviceID = ?, rating = ?, comments = ? WHERE reviewID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, review.getUserID());
            statement.setString(2, review.getServiceID());
            statement.setInt(3, review.getRating());
            statement.setString(4, review.getComments());
            statement.setString(5, review.getReviewID());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean deleteReview(String reviewID) {
        String query = "DELETE FROM tblReviews WHERE reviewID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, reviewID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public static void main(String[] args) {
        // Test ReviewDAO
        ReviewDAO reviewDAO = new ReviewDAO();
        System.out.println("---- Testing ReviewDAO ----");

        // 1. Create a new review
        ReviewDTO newReview = new ReviewDTO("rev1", "user1", "svc1", 5, "Amazing service!");
        if (reviewDAO.createReview(newReview)) {
            System.out.println("Review created successfully!");
        } else {
            System.out.println("Failed to create review.");
        }

        // 2. Get all reviews
        List<ReviewDTO> reviews = reviewDAO.getAllReviews();
        System.out.println("List of reviews:");
        for (ReviewDTO review : reviews) {
            System.out.println(review.getReviewID() + ": " + review.getUserID() + " rated " + review.getRating() + " stars");
        }

        // 3. Update a review
        newReview.setRating(4);
        newReview.setComments("Good service, but a bit expensive.");
        if (reviewDAO.updateReview(newReview)) {
            System.out.println("Review updated successfully!");
        } else {
            System.out.println("Failed to update review.");
        }

        // 4. Get review by ID
        ReviewDTO reviewById = reviewDAO.getReviewById("rev1");
        if (reviewById != null) {
            System.out.println("Retrieved review: " + reviewById.getRating() + " stars - " + reviewById.getComments());
        } else {
            System.out.println("Review not found.");
        }

        // 5. Delete a review
        if (reviewDAO.deleteReview("rev1")) {
            System.out.println("Review deleted successfully!");
        } else {
            System.out.println("Failed to delete review.");
        }
    }
}
