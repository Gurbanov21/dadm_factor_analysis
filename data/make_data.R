# Creates the simulated customer survey used in the handout and slides.
# Run once: Rscript data/make_data.R  (writes data/customer_survey.csv)

set.seed(2026)
n <- 400

# Three correlated latent drivers: product, service, price
phi <- matrix(c(1.0, 0.3, 0.2,
                0.3, 1.0, 0.25,
                0.2, 0.25, 1.0), 3, 3)
latent <- matrix(rnorm(n * 3), n, 3) %*% chol(phi)
colnames(latent) <- c("product", "service", "price")

make_item <- function(f, loading) {
  x <- loading * f + sqrt(1 - loading^2) * rnorm(length(f))
  pmin(pmax(round(4 + 1.3 * x), 1), 7)   # 7-point Likert scale
}

survey <- data.frame(
  quality      = make_item(latent[, "product"], 0.80),
  durability   = make_item(latent[, "product"], 0.75),
  design       = make_item(latent[, "product"], 0.70),
  variety      = make_item(latent[, "product"], 0.65),
  delivery     = make_item(latent[, "service"], 0.75),
  support      = make_item(latent[, "service"], 0.80),
  returns      = make_item(latent[, "service"], 0.70),
  communication = make_item(latent[, "service"], 0.65),
  price_fair   = make_item(latent[, "price"], 0.80),
  discounts    = make_item(latent[, "price"], 0.70),
  value        = make_item(latent[, "price"], 0.75),
  cheaper_than_rivals = make_item(latent[, "price"], 0.60)
)

# Outcome: overall satisfaction (1-10), driven mostly by service
sat <- 0.25 * latent[, "product"] + 0.55 * latent[, "service"] +
  0.15 * latent[, "price"] + rnorm(n, sd = 0.7)
survey$satisfaction <- pmin(pmax(round(6 + 1.5 * sat), 1), 10)

write.csv(survey, "data/customer_survey.csv", row.names = FALSE)
