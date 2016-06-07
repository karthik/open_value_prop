
library(dplyr)
library(ggplot2)
library(wesanderson)
library(readr)
df <- read_tsv("Erin_data.tsv")
figure <- df %>%
    mutate(discipline = gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", discipline, perl = TRUE)) %>%
    ggplot(aes(value, reorder(discipline, value), color = type)) +
    geom_point(size = 3) +
    geom_vline(xintercept = 1, linetype = "dashed") +
   scale_x_log10(limits = c(0.33, 10), breaks = c(.33, 1, 3, 10)) +
    xlab("Relative Citation Rate (OA: non OA)") +
    ylab("Discipline") +
    scale_color_manual(values = wes_palette("Darjeeling"))
    figure
    ggsave(figure, file = "figure.png")
