# expected make version >= 3.82

.ONESHELL:

CARGO_TARGET_DIR =$(shell pwd)
WEB_DIR =$(shell pwd)/web
POSTS_DIR =$(shell pwd)/contracts/posts
LOCUTUS_DIR=$(shell cd locutus && pwd)

build-tool:
	rm -rf /tmp/locutus
	cd $(LOCUTUS_DIR)
	cd crates/locutus-node
	cargo install --path .
	cargo build

webapp:
	cd $(WEB_DIR)

	CARGO_TARGET_DIR="${CARGO_TARGET_DIR}" ldt build
	ldt publish --code build/locutus/poc_proposal_assessment.wasm --state build/locutus/contract-state
	../locutus/target/debug/ldt publish --code build/locutus/poc_proposal_assessment.wasm --state build/locutus/contract-state

posts:
	cd $(POSTS_DIR)

	CARGO_TARGET_DIR="${CARGO_TARGET_DIR}" ldt build
	ldt publish --code build/locutus/poc_proposal_assessment_posts.wasm --state build/locutus/contract-state
	../../locutus/target/debug/ldt publish --code build/locutus/poc_proposal_assessment_posts.wasm --state build/locutus/contract-state

build: build-tool posts webapp

run: 
	locutus-node local 
