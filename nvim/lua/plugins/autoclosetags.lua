return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufNewFile" },

	config = function()
		require('nvim-ts-autotag').setup({
		filetypes = { "html", "xml", "javascript", "svelte", "css" },
	})
	end

}
