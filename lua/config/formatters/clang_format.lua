return {
	-- https://clang.llvm.org/docs/ClangFormatStyleOptions.html
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
