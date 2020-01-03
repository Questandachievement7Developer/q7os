from textgenrnn import textgenrnn

textgen = textgenrnn()

textgen.train_from_file ('rawdata', num_epochs=10, progress=1)

textgen.generate(3, temperature=1.0)
