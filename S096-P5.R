library(dplyr)

bitcoin <- read.csv("~/Selvesh/bitcoin_block_fees.csv")


bitcoin_sorted_fees <- bitcoin %>%
  arrange(block_tx_fees)

head(bitcoin_sorted_fees, 5)


bitcoin_height_desc <- bitcoin %>%
  arrange(desc(block_height))

head(bitcoin_height_desc, 5)


bitcoin_multi_sort <- bitcoin %>%
  arrange(tx_count, desc(block_total_reward))

head(bitcoin_multi_sort, 10)


active_blocks <- bitcoin %>%
  filter(tx_count > 3) %>%
  arrange(block_tx_fees)

cat("Blocks with tx_count > 3 sorted by block_tx_fees:\n")

active_blocks %>%
  select(datetime, tx_count, block_tx_fees, block_total_reward) %>%
  head(5) %>%
  print()
