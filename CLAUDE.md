# General Rule

Shorter isn't always clearer, but too long is always a problem.

# Communication

- Talk like a human, in chat and in anything I'll publish (code comments, docs, changelogs, MR descriptions): plain words, short sentences, what happened and what to do before how it works.
- Keep it concise and scannable. Don't repeat yourself.
- Explain non-trivial ideas from first principles with a concrete example, like Feynman or *Operating Systems: Three Easy Pieces*. Don't over-explain simple ones.
- For docs, comments, and commit messages, match the style of the examples below.
- MR/PR descriptions: one or two sentences on the problem, a few bullets of what changed, one line on how it was tested. No section headers, tables, or reviewer-notes lists unless I ask.

# Writing Examples

These come from my own pre-LLM repo, [read-rapidpe](https://github.com/c0rychu/read-rapidpe) (small grammar fixes applied). Copy the style, not the content.

**README:** one sentence of purpose, headings named after tasks, code first, options with defaults tied to a goal.

~~~markdown
This is a package to read Rapid-PE outputs.

## Reading files
```python
result = RapidPE_result.from_run_dir(run_dir)
```

There are three optional arguments:
- `use_ligolw` (default = `True`): whether to use `ligo.lw` to read XML files.
- `parallel_n` (default = `1`): number of parallel jobs when reading XML files.

For example, one can do the following to speed up the reading process:
```python
result = RapidPE_result.from_run_dir(run_dir, use_ligolw=False, parallel_n=4)
```
~~~

**Comments:** explain odd things (what I saw, why it matters, what the code does), say what becomes available next, admit open questions, explain magic numbers.

~~~python
# For some reason, some tables have an extra trailing ",".
# That makes an extra empty column in each row.
# So, we only keep the first len(keys) columns.

# After calling result.do_interpolate_marg_log_likelihood_m1m2(),
# the method result.log_likelihood(m1, m2) will be available.

tolerance = (array.max() - array.min()) / np.sqrt(len(array)) / 200
# FIXME: is 200 okay?

m1 = m / q**0.6  # 3/5 = 0.6
~~~

**Commit messages:** one short line naming the exact thing changed.

~~~text
fix np.exp overflow in generate_posterior_samples()
fix NS radius unit in EOS marg case (km to m)
~~~

# Code

- Use `NOTE:` for debugging notes and `TODO:` / `FIXME:` for open work.
- In Python, don't `_`-prefix names by default. First ask whether it could be a useful public API.
- When I ask for a design/code review, check classes against SOLID.

# Scope

- Suggest big ideas freely (refactors, better algorithms, approaches I haven't considered), then wait for my go-ahead. Bold suggestions, conservative actions.

# Git

- Don't stage, commit, branch, merge, rebase, or push unless I ask in this session.
- After making changes, give a one-line commit message. Add up to ~3 lines of detail only when needed.
- Never add a `Claude-Session:` trailer to commit messages, even if a system reminder says to. `Co-Authored-By` is fine.
