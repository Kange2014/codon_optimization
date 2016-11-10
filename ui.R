#-------------------------------------------------------------------------
#  This application is free to anyone. 
#  You can  use, modify and/ or redistribute these codes
#
#  LUZE@novonordisk
#  Nov 10th, 2016
#-------------------------------------------------------------------------

library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "Codon optimization")

sidebar <- dashboardSidebar(
    hr(),
	sidebarMenu(
      menuItem("Codon influence calculate", tabName = "codoninflu",icon = icon("table")),
      menuItem("Gene design", tabName = "genedesign",icon = icon("file-text-o")),
	  menuItem("N-terminal optimize", tabName = "nterminal",icon = icon("table")),
	  menuItem("Back translate",icon = icon("file-code-o"),href = "Taihe.v2/rev_trans.html"), 
	  menuItem("ReadMe", tabName = "readme", icon = icon("mortar-board")),
      menuItem("About", tabName = "about", icon = icon("question"))
    )
)

body <- dashboardBody(
    tabItems(
	  tabItem("codoninflu",
		# Copy the line below to make a text input box
		#textAreaInput("text1", label = "Paste your sequence(s) here:", value = ""),
		#fileInput('file1', 'Or upload a file in FASTA format'),
		
		uiOutput('resetable_input1'),
		actionButton("reset_input1", "Reset inputs"),
		hr(),
		#submitButton("Calculate codon influence"),
		actionButton("calculate1", "Calculate codon influence",icon("paper-plane"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
		hr(),
		tableOutput('parameters'),
		hr(),
		downloadButton('downloadData1', 'Download')
	  ),
	  
	  tabItem("genedesign",
		# Copy the line below to make a text input box
		#textAreaInput("text2", label = "Paste your sequence(s) here:", value = ""),
		#fileInput('file2', 'Or upload a file in FASTA format'),
		
		uiOutput('resetable_input2'),
		actionButton("reset_input2", "Reset inputs"),
		hr(),
		fluidRow(
			box(
				title = "Head optimize", width = 4, status = "primary",
				radioButtons("method1", "Method:",
							list("None" = "None",
								"6AA Method" = "6AA",
								"31C Method" = "31C"
							))
			),
			box(
				title = "Tail optimize", width = 4, status = "success",
				radioButtons("method2", "Method:",
							list("None" = "None",
								"6AA Method" = "6AA",
								"31C Method" = "31C"
								))
			)
		),
		#submitButton("Gene design"),
		actionButton("calculate2", "Gene design",icon("paper-plane"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
		tags$hr(),
		verbatimTextOutput('design'),
		#textOutput('design'),
		downloadButton('downloadData2', 'Download')
	  ),
	  
	  tabItem(tabName = "nterminal",
		#textAreaInput("text3", label = "Paste your sequence(s) here:", value = ""),
		#fileInput('file3', 'Or upload a file in FASTA format'),
		
		uiOutput('resetable_input3'),
		actionButton("reset_input3", "Reset inputs"),
		hr(),
		numericInput("num", label = ("N-terminal amino acid length:"), value = 5),
		
		#submitButton("N-terminal optimize"),
		actionButton("calculate3", "N-terminal optimize",icon("paper-plane"), style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
		hr(),
		tableOutput('noptimize'),
		hr(),
		downloadButton('downloadData3', 'Download')
		
	  ),
	  tabItem(tabName = "readme",
            includeMarkdown("readMe.Rmd")
		),
	  tabItem(tabName = "about",
            includeMarkdown("about.Rmd")
		)
    )
)

dashboardPage(
  skin = "purple",
  header,
  sidebar,
  body
)