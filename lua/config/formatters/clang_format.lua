-- https://clang.llvm.org/docs/ClangFormatStyleOptions.html
return {
	prepend_args = {
		"--style={ "
			.. "BasedOnStyle: llvm, "
			.. "UseTab: Always, "
			.. "IndentWidth: 4, "
			.. "TabWidth: 4, "
			.. "Cpp11BracedListStyle: false"
			.. " }",
	},
}
