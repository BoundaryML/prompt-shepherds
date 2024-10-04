from enum import Enum
from typing import List
from app import utils
from baml_client import b
from baml_client.types import Source


def find_source(content: str) -> Source:
    try:
        return b.IdentifySource(content=content)
    except Exception as e:
        return Source.Other
    
class Fact:
    def __init__(self, summary: str, citation: List[str], source_content: str):
        self.summary = summary
        self.citation = citation
        self.is_reliable = [source in source_content for source in citation]

    def __str__(self):
        if not any(self.is_reliable):
            return f"(Unreliable) {self.summary}"
        return self.summary

def extract_facts(content: str) -> list[Fact]:
    response = b.ExtractFacts(content=content)
    # prev = 0
    # for response in stream:
    #     if len(response.facts) > prev:
    #         prev = len(response.facts)
    #         print(f"Found {prev} facts")
    # response = stream.get_final_response()
    res = []
    for fact in response.facts:
        f = Fact(fact.summary, fact.citation, content)
        if not all(f.is_reliable):
            cirations = b.FindExtactCition(summary=f.summary, citation=f.citation)
    return res

def extract_opinions(content: str) -> list[str]:
    return []

def read_file(file_path: str) -> str:
    with open(file_path, 'r') as f:
        return f.read()

def main():
    content = read_file("tests/cnn1.txt")
    source = find_source(content)
    print(f"Article is from: {source.name}")

    facts = extract_facts(content)
    opinions = extract_opinions(content)

    print(f"Facts are:")

    for i, fact in enumerate(facts):
        print(f"{i + 1}: {fact}")
    print("------------------")
    print("Opinions are:")
    for i, opinion in enumerate(opinions):
        print(f"{i + 1}: {opinion}")


if __name__ == "__main__":
    main()
