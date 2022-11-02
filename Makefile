# expected make version >= 3.82

.ONESHELL:

CARGO_TARGET_DIR =$(shell pwd)
WEB_DIR =$(shell pwd)/web
POSTS_DIR =$(shell pwd)/contracts/posts
LOCUTUS_DIR=$(shell cd locutus && pwd)

build-tool:
	cd $(LOCUTUS_DIR)
	cd crates/locutus-node
	cargo install --path .

webapp:
	cd $(WEB_DIR)

	CARGO_TARGET_DIR="${CARGO_TARGET_DIR}" ldt build
#	#mv ./build/locutus/freenet_microblogging_web.wasm ../../../crates/locutus-node/examples/
#	#mv ./build/locutus/contract-state ../../../crates/locutus-node/examples/freenet_microblogging_web

posts:
	cd $(POSTS_DIR)

	CARGO_TARGET_DIR="${CARGO_TARGET_DIR}" ldt build
#	mv ./build/locutus/freenet_microblogging_posts.wasm ../../../../crates/locutus-node/examples/
#	mv ./build/locutus/contract-state ../../../../crates/locutus-node/examples/freenet_microblogging_posts

build: build-tool webapp posts

run:
	cd $(LOCUTUS_DIR)
	cd crates/locutus-node/examples
	cargo run --example contract_browsing 
