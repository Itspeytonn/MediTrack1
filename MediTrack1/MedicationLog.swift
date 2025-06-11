import SwiftUI
import SwiftData
struct MedicationLog: View {
  @Query private var logs: [Log]
  @Environment(\.modelContext) private var context
  @State private var newMedicationName = ""
  @State private var newLogDate = Date.now
  @State private var selectedLog: Log?
  //end array
  var body: some View {
    NavigationStack {
      List {
        ForEach(logs) { log in
          HStack {
              Text(log.name)
              Spacer()
              Text(log.newLogDate, format: .dateTime.month(.wide).day().year())
            }
            //end hstack
          .onTapGesture {
            selectedLog = log
          }
        }
        .onDelete(perform: deleteLog)
      }
      //end list
      .navigationTitle("Medicine")
      .sheet(item: $selectedLog) { log in
        NavigationStack {
          EditLog(log: Log)
        }
      }
      .safeAreaInset(edge: .bottom) {
        VStack(alignment: .center, spacing: 20) {
            Text("Log New Medication")
              .font(.headline)
          DatePicker(selection: $newLogDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                TextField("Name", text: $newMedicationName)
                  .textFieldStyle(.roundedBorder)
              }
          Button("Log") {
            let newLog = Log(name: newMedicationName, birthday: newLogDate)
            context.insert(newLog)
            newMedicationName = ""
            newLogDate = .now
          }
          //end button
          .bold()
        }
        //end VStack
        .padding()
        .background(.bar)
      }
      //end safenet
    }
    //end nav stack
  }
  //end body view
}
//end content
#Preview {
  MedicationLog()
    .modelContainer(for:Log.self, inMemory: true)
}











Message group2_1-7









