filter(df, var > 20000 & var < 30000) 
filter(df, var == 'string') # df %>% filter(var != 'string')
df %>% filter(var != 'string')
df %>% group_by(group) %>% filter(sum(var) > 2000000)