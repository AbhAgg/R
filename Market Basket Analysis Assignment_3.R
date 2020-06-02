#install.packages("arules")
#install.packages("arulesviz")

data(Epub)
View(Epub)

str(Epub)
inspect(Epub[1:5])
# The summary says the dataset has 15729 transactions or baskets in it, each with a unique ID
# It has three columns viz. Items, TransactionID and Timestamp i.e.time of purchase as can be seen in the output below

summary(Epub)
# The summary shows the five most frequently purchased items viz. doc_11d, doc_813, doc_4c6, doc_955, doc_698

#Apriori Algorithm Implementation

gr_rules = apriori(Epub,parameter = list(supp = 0.01, conf = 0.8))
# After the above command we can see no pairings can be found this means we need to adjust the values
# of support and confidence
# Confidence will not be chosen less than 60% or 0.60 and support can be fine tuned till we start to see some relations

gr_rules = apriori(Epub,parameter = list(supp = 0.001, conf = 0.65))
# the above combination of Support 0.1% and Confidence of 65% reveals 7 set of rules 


inspect(sort(gr_rules, by  ="lift", decreasing =T))
# The above command displays all the rule-sets in a decreasing order of lift starting with maximum lift of 454.75%
# This means that if {doc_6e7,doc_6e8} are purchased then chances of purchasing {doc_6e9} increases dramatically by approx 454%
# Lift is the factor by which, the co-occurence of A and B exceeds the expected probability of A and B co-occuring, had they been independent. 
# So, higher the lift, higher the chance of A and B occurring together.


redundant_rules = is.redundant(gr_rules)
summary(redundant_rules)
# The above commands remove any redundancies in the rules made so that no repetitions remain in the rule base
# The output shows no duplicates 

gr_rules_doc_4c7 = apriori(Epub,parameter = list(supp = 0.0005, conf = 0.9), appearance = list(default = "lhs","rhs" = "doc_4c7" ))
inspect(sort(gr_rules_doc_4c7, by  ="lift", decreasing =T))
# The above commands show what products people generally buy before purchasing doc_4c7
# The support value had to be lowered to roughly 0.05% to find relevant rules or product combinations.
# Although the confidence level is 90% which implies that there is a very high chance of purchasing doc_4c7 after purchasing 
# the products mentioned in the rules.


