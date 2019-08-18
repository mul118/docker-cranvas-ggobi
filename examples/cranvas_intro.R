# Cranvas Intro Tutorial
# 
# Cranvas tutorial/case-study, adopting material from the Mondrian introductory case study
# found at http://www.interactivegraphics.org/Slides_files/Mondrian.pdf

library('cranvas')

# Read data, convert to mutaframe
tips  <- read.delim('http://www.interactivegraphics.org/Datasets_files/tips.txt', stringsAsFactors = FALSE, header = TRUE)
qtips <- qdata(tips)

# First plots
qhist(Bill.in.USD, qtips)
qhist(Tip.in.USD, qtips)

# Barcharts of categorical/orinal variables
qbar(Gender, qtips)
qbar(Day.Night, qtips)
qbar(Smoker, qtips)
qbar(Size.of.Party, qtips)
qbar(Weekday, qtips)

# Tips ratio
qtips['Tip.over.Bill'] <- qtips['Tip.in.USD']/qtips['Bill.in.USD']
qhist(Tip.over.Bill, qtips)
qscatter(Bill.in.USD, Tip.over.Bill, qtips)

# Tip by Group Size
qbox()
qbox()
qparallel()

# Clean up
cranvas_off()