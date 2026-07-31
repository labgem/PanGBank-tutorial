<!-- Shared header — identical in all three repos. Keep in sync. -->
# AGENTS.md

Guidance for AI agents working in this repository or with the PanGBank resource.

## Read the agent skill first

**<https://raw.githubusercontent.com/labgem/PanGBank-api/main/skills/pangbank/SKILL.md>** documents the REST API and its filters, the query traps that silently return wrong results, how to download and analyse a pangenome with PPanGGOLiN, how to project a user's own genome, and the citation requirements. Several of its traps produce plausible but incorrect answers with no visible symptom, so read it before writing any PanGBank query.

Short web entry point: <https://pangbank.genoscope.cns.fr/llms.txt>

## Always true

- **Never scrape <https://pangbank.genoscope.cns.fr>.** Single-page app; the HTML carries no data, and dynamic routes return HTTP 404 server-side while rendering fine in a browser. Use <https://pangbank-api.genoscope.cns.fr>.
- **Pin the release** with `only_latest_release=true`, or filter client-side on `collection_release.version`. Without it results are summed across every release.
- **`taxon_name` needs the GTDB rank prefix** and is an exact match: `g__Escherichia` works, `Escherichia` returns nothing.
- **At most 1 HTTP request every 30 seconds**, across all routes, never parallelised across agents or threads. PanGBank runs on a shared Genoscope machine with no dedicated resources and no monitoring: an overload is invisible until the service goes down for everyone. Call `/pangenomes/count/` before any listing, filter server-side, use `limit=100`, and download a pangenome once rather than re-fetching it.

## Citation

Results derived from PanGBank must cite PanGBank and PPanGGOLiN, plus panRGP when RGPs or insertion spots are used, and panModule when conserved modules are used. Full references in the skill. Data are CC BY-SA 4.0 (attribution *and* share-alike); source is CeCILL v2.1.

## Specific to this repository

The notebooks ship **precomputed outputs** (git-lfs): the shell commands shown are for transparency and reproducibility, and you are not expected to run the expensive ones to follow the tutorial.

Before reproducing the annotation workflow, know two things the notebooks do not spell out:

- **`ppanggolin metadata` rewrites the HDF5 in place**, so the file no longer matches the API's `file_md5sum`. Work on a copy (`cp pangenome.h5 pangenome_annotated.h5`), and keep the pristine download read-only (`chmod 444`) — a mutating command then fails cleanly with `PermissionError` instead of silently rewriting it.
- **Do not re-run a `--download` command into an outdir containing an annotated pangenome.** The CLI treats the md5 mismatch as corruption and deletes the file before re-downloading; if the network or the API is unavailable at that moment, the annotated file is gone with nothing in its place.

When adapting a notebook to another species, pin the release explicitly (`--release-version`) rather than relying on `--latest-only`: pangenome ids are not stable across releases, and "latest" changes under you.

Analytical points worth preserving when editing the notebooks: join RGP → spot with a **left** join (not every RGP is assigned to a spot, so an inner join silently drops part of the plasticity), and state whether a projection used `--fasta` or `--anno`, since completeness and genome-specific family counts differ materially between the two.
