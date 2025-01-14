package gg.jte.generated.ondemand;
import ch.heigvd.dai.controller.*;
import ch.heigvd.dai.model.*;
@SuppressWarnings("unchecked")
public final class JtemoiGenerated {
	public static final String JTE_NAME = "moi.jte";
	public static final int[] JTE_LINE_INFO = {0,0,1,2,2,2,2,16,16,16,16,16,17,17,17,18,18,18,20,20,20,20,2,2,2,2};
	public static void render(gg.jte.html.HtmlTemplateOutput jteOutput, gg.jte.html.HtmlInterceptor jteHtmlInterceptor, Events events) {
		jteOutput.writeContent("\r\n<script>\r\n    function getData() {\r\n        const url = \"http://localhost:7000/api/events\";\r\n        try {\r\n            fetch(url);\r\n        } catch (error) {\r\n            console.error(error.message);\r\n        }\r\n    }\r\n    getData()\r\n</script>\r\n\r\n");
		boolean __jte_for_loop_entered_1 = false;
		for (Event event : events.events) {
			__jte_for_loop_entered_1 = true;
			jteOutput.writeContent("\r\n    <li>");
			jteOutput.setContext("li", null);
			jteOutput.writeUserContent(event.toString());
			jteOutput.writeContent("</li>\r\n");
		}
		if (!__jte_for_loop_entered_1) {
			jteOutput.writeContent("\r\n    NOOOOO\r\n");
		}
	}
	public static void renderMap(gg.jte.html.HtmlTemplateOutput jteOutput, gg.jte.html.HtmlInterceptor jteHtmlInterceptor, java.util.Map<String, Object> params) {
		Events events = (Events)params.get("events");
		render(jteOutput, jteHtmlInterceptor, events);
	}
}
