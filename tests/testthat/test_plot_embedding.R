context("Test embedding functions")

## .prepare_umap_embedding is correct

.check_prepare_umap_embedding <- function(res, n, rank_1, rank_c){
  expect_true(is.list(res))
  expect_true(all(sort(names(res)) == sort(c("common", "distinct", "everything"))))
  expect_true(all(dim(res$common) == c(n, rank_c)))
  expect_true(all(dim(res$distinct) == c(n, rank_1)))
  expect_true(all(dim(res$everything) == c(n, rank_1)))
  for(i in 1:3){
    expect_true(length(rownames(res[[i]])) > 1)
  }
  invisible()
}

test_that(".prepare_umap_embedding works", {
  set.seed(1)
  n <- 100; K <- 3
  common_space <- scale(MASS::mvrnorm(n = n, mu = rep(0,K), Sigma = diag(K)), center = T, scale = F)
  p1 <- 5; p2 <- 10
  transform_mat_1 <- matrix(stats::runif(K*p1, min = -1, max = 1), nrow = K, ncol = p1)
  transform_mat_2 <- matrix(stats::runif(K*p2, min = -1, max = 1), nrow = K, ncol = p2)
  mat_1 <- common_space %*% transform_mat_1 + scale(MASS::mvrnorm(n = n, mu = rep(0,p1), Sigma = diag(p1)), center = T, scale = F)
  mat_2 <- common_space %*% transform_mat_2 + scale(MASS::mvrnorm(n = n, mu = rep(0,p2), Sigma = diag(p2)), center = T, scale = F)
  rownames(mat_1) <- 1:n; rownames(mat_2) <- 1:n
  dcca_res <- dcca_factor(mat_1, mat_2, dims_1 = 1:K, dims_2 = 1:K, verbose = F)
  dcca_obj <- dcca_decomposition(dcca_res, rank_c = K, verbose = F)
  
  res <- .prepare_embeddings(dcca_obj, data_1 = T, data_2 = T, 
                             add_noise = F)
  .check_prepare_umap_embedding(res, n, 2*K, 2*K)
  
  res <- .prepare_embeddings(dcca_obj, data_1 = T, data_2 = T, 
                             add_noise = T)
  .check_prepare_umap_embedding(res, n, 2*K, 2*K)
  
  res <- .prepare_embeddings(dcca_obj, data_1 = T, data_2 = F, 
                             add_noise = T)
  .check_prepare_umap_embedding(res, n, K, K)
  
  res <- .prepare_embeddings(dcca_obj, data_1 = F, data_2 = T, 
                             add_noise = T)
  .check_prepare_umap_embedding(res, n, K, K)
})

#############################

## .extract_matrix_helper is correct

.check_extract_matrix_helper <- function(res, n){
  expect_true(is.matrix(res))
  expect_true(nrow(res) == n)
  expect_true(nrow(res) == n)
  invisible()
}

test_that(".extract_matrix_helper works", {
  set.seed(1)
  n <- 100; K <- 3
  common_space <- scale(MASS::mvrnorm(n = n, mu = rep(0,K), Sigma = diag(K)), center = T, scale = F)
  p1 <- 5; p2 <- 10
  transform_mat_1 <- matrix(stats::runif(K*p1, min = -1, max = 1), nrow = K, ncol = p1)
  transform_mat_2 <- matrix(stats::runif(K*p2, min = -1, max = 1), nrow = K, ncol = p2)
  mat_1 <- common_space %*% transform_mat_1 + scale(MASS::mvrnorm(n = n, mu = rep(0,p1), Sigma = diag(p1)), center = T, scale = F)
  mat_2 <- common_space %*% transform_mat_2 + scale(MASS::mvrnorm(n = n, mu = rep(0,p2), Sigma = diag(p2)), center = T, scale = F)
  dcca_res <- dcca_factor(mat_1, mat_2, dims_1 = 1:K, dims_2 = 1:K, verbose = F)
  dcca_obj <- dcca_decomposition(dcca_res, rank_c = K, verbose = F)

  res <- .extract_matrix_helper(dcca_obj$common_score, dcca_obj$distinct_score_1,
                                dcca_obj$svd_1, common_bool = T, distinct_bool = T, add_noise = T,
                                center = T, renormalize = T)
  .check_extract_matrix_helper(res, n)
  
  res <- .extract_matrix_helper(dcca_obj$common_score, dcca_obj$distinct_score_1,
                                dcca_obj$svd_1, common_bool = T, distinct_bool = T, add_noise = F,
                                center = T, renormalize = T)
  .check_extract_matrix_helper(res, n)
  
  res <- .extract_matrix_helper(dcca_obj$common_score, dcca_obj$distinct_score_1,
                                dcca_obj$svd_1, common_bool = T, distinct_bool = F, add_noise = T,
                                center = T, renormalize = T)
  .check_extract_matrix_helper(res, n)
  
  res <- .extract_matrix_helper(dcca_obj$common_score, dcca_obj$distinct_score_1,
                                dcca_obj$svd_1, common_bool = F, distinct_bool = T, add_noise = T,
                                center = T, renormalize = T)
  .check_extract_matrix_helper(res, n)
  
  res <- .extract_matrix_helper(dcca_obj$common_score, dcca_obj$distinct_score_2,
                                dcca_obj$svd_2, common_bool = T, distinct_bool = T, add_noise = T,
                                center = T, renormalize = T)
  .check_extract_matrix_helper(res, n)
})
