old_x_union_y <- function(transactions, items)
{
  df <- transactions
  for (i in 1:length(items))
  {
    colname <- items[i]
    rowcontainsitem <- df[,colname]==1
    df <- df[ rowcontainsitem, ]
  }
  df[,'Tid']
}

old2_x_union_y <- function(transactions, items)
{
  df <- transactions
  f <- function(colname) {
    rowcontainsitem <- df[,colname]==1
    df <- df[ rowcontainsitem, ]
  }
  mapply(f, items)
  df[,'Tid']
}

x_union_y <- function(df, items)
{
  mapply(function(colname) {rowcontainsitem <- df[,colname]==1; df <- df[ rowcontainsitem, ]}, items)
  df[,'Tid']
}  