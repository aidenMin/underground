def chunks(l, n, counter=len):
    """Yield successive n-sized chunks from l."""
    for i in range(0, counter(l), n):
        yield l[i:i + n]
