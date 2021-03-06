package com.codesquad.sidedish10.parser.controller;

import com.codesquad.sidedish10.parser.service.ParseService;
import java.text.ParseException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class parserController {

  private final ParseService parseService;

  public parserController(ParseService parseService) {
    this.parseService = parseService;
  }

  @GetMapping("/parse/items")
  public String parseMenuAPI() throws ParseException {
    parseService.IterateBabChanURLsAndInsert();
    parseService.insertBabChanDetailService();
    return "work done. check your mysql";
  }
}
