import React, { useState, useEffect } from 'https://esm.sh/react?dev';
import { createRoot } from 'https://esm.sh/react-dom/client?dev';
import {
  ChevronLeft,
  ChevronRight,
  RotateCcw,
  CheckCircle,
  XCircle,
  Clock,
  BookOpen,
} from 'https://esm.sh/lucide-react?dev';

const questions = [
  {
    id: 1,
    question: "¿Cuál es la diferencia principal entre un lenguaje compilado y uno interpretado?",
    options: [
      "Los compilados son más lentos que los interpretados",
      "Los compilados se traducen completamente antes de ejecutarse, los interpretados línea por línea",
      "Los interpretados solo funcionan en Windows",
      "No hay diferencia real entre ambos"
    ],
    correct: 1,
    explanation: "Los lenguajes compilados se traducen completamente a código máquina antes de la ejecución, mientras que los interpretados se traducen línea por línea durante la ejecución."
  },
  {
    id: 2,
    question: "¿Qué es la 'complejidad temporal' en algoritmos?",
    options: [
      "El tiempo que tarda en escribirse el código",
      "La medida de cuánto tiempo tarda un algoritmo en ejecutarse respecto al tamaño de entrada",
      "La cantidad de líneas de código",
      "El tiempo de compilación"
    ],
    correct: 1,
    explanation: "La complejidad temporal mide cómo crece el tiempo de ejecución de un algoritmo en relación al tamaño de los datos de entrada."
  },
  {
    id: 3,
    question: "¿Cuál es el principio DRY en programación?",
    options: [
      "Don't Repeat Yourself - No te repitas",
      "Do Run Yearly - Ejecuta anualmente",
      "Data Requires Yielding - Los datos requieren rendimiento",
      "Debug Regularly Yourself - Depura regularmente tú mismo"
    ],
    correct: 0,
    explanation: "DRY significa 'Don't Repeat Yourself', un principio que promueve evitar la duplicación de código para mejorar la mantenibilidad."
  },
  {
    id: 4,
    question: "¿Qué es un 'stack overflow'?",
    options: [
      "Un sitio web para programadores",
      "Un error que ocurre cuando se agota la memoria de la pila de llamadas",
      "Un tipo de estructura de datos",
      "Una técnica de optimización"
    ],
    correct: 1,
    explanation: "Un stack overflow ocurre cuando la pila de llamadas se llena, generalmente por recursión infinita o demasiadas llamadas anidadas."
  },
  {
    id: 5,
    question: "¿Cuál es la diferencia entre '==' y '===' en JavaScript?",
    options: [
      "No hay diferencia",
      "'==' compara valor y tipo, '===' solo valor",
      "'==' compara solo valor, '===' compara valor y tipo",
      "'===' es más rápido que '=='"
    ],
    correct: 2,
    explanation: "En JavaScript, '==' hace comparación con coerción de tipos, mientras que '===' hace comparación estricta sin coerción."
  },
  {
    id: 6,
    question: "¿Qué es la herencia en programación orientada a objetos?",
    options: [
      "La capacidad de una clase de usar propiedades y métodos de otra clase",
      "El proceso de crear objetos",
      "La encapsulación de datos",
      "El polimorfismo de métodos"
    ],
    correct: 0,
    explanation: "La herencia permite que una clase (clase hija) adquiera las propiedades y métodos de otra clase (clase padre)."
  },
  {
    id: 7,
    question: "¿Cuál es el propósito principal de Git?",
    options: [
      "Compilar código",
      "Control de versiones y colaboración en código",
      "Ejecutar aplicaciones web",
      "Crear interfaces de usuario"
    ],
    correct: 1,
    explanation: "Git es un sistema de control de versiones distribuido que permite rastrear cambios en el código y facilitar la colaboración."
  },
  {
    id: 8,
    question: "¿Qué es una API REST?",
    options: [
      "Un tipo de base de datos",
      "Una arquitectura para servicios web que usa HTTP",
      "Un lenguaje de programación",
      "Un framework de JavaScript"
    ],
    correct: 1,
    explanation: "REST es un estilo arquitectónico para servicios web que utiliza métodos HTTP estándar para la comunicación."
  },
  {
    id: 9,
    question: "¿Cuál es la diferencia entre un array y una lista enlazada?",
    options: [
      "No hay diferencia",
      "Los arrays tienen tamaño fijo, las listas enlazadas son dinámicas",
      "Las listas enlazadas son más rápidas para acceso aleatorio",
      "Los arrays no pueden almacenar números"
    ],
    correct: 1,
    explanation: "Los arrays tienen elementos en posiciones contiguas de memoria, mientras que las listas enlazadas conectan elementos mediante punteros."
  },
  {
    id: 10,
    question: "¿Qué es el 'Big O notation'?",
    options: [
      "Una forma de documentar código",
      "Un método de depuración",
      "Una notación para expresar la complejidad de algoritmos",
      "Un tipo de comentario en código"
    ],
    correct: 2,
    explanation: "Big O notation es una forma matemática de describir la complejidad temporal o espacial de un algoritmo en el peor caso."
  },
  {
    id: 11,
    question: "¿Qué es un 'deadlock' en programación concurrente?",
    options: [
      "Un error de sintaxis",
      "Una situación donde dos o más procesos se bloquean mutuamente",
      "Un tipo de estructura de datos",
      "Una técnica de optimización"
    ],
    correct: 1,
    explanation: "Un deadlock ocurre cuando dos o más procesos se bloquean indefinidamente esperando recursos que están siendo utilizados por los otros."
  },
  {
    id: 12,
    question: "¿Cuál es el propósito de los 'unit tests'?",
    options: [
      "Medir la velocidad del código",
      "Probar componentes individuales del software",
      "Compilar el programa",
      "Crear documentación"
    ],
    correct: 1,
    explanation: "Los unit tests verifican que componentes individuales (funciones, métodos, clases) funcionen correctamente de forma aislada."
  },
  {
    id: 13,
    question: "¿Qué es el 'refactoring'?",
    options: [
      "Agregar nuevas funcionalidades",
      "Reestructurar código existente sin cambiar su comportamiento externo",
      "Corregir errores en el código",
      "Optimizar la velocidad de ejecución"
    ],
    correct: 1,
    explanation: "Refactoring es el proceso de reestructurar código existente para mejorar su legibilidad y mantenibilidad sin alterar su funcionalidad."
  },
  {
    id: 14,
    question: "¿Cuál es la diferencia entre SQL y NoSQL?",
    options: [
      "SQL es más nuevo que NoSQL",
      "SQL usa tablas relacionales, NoSQL usa estructuras flexibles",
      "NoSQL solo funciona con números",
      "No hay diferencia práctica"
    ],
    correct: 1,
    explanation: "SQL usa bases de datos relacionales con esquemas fijos, mientras que NoSQL permite estructuras de datos más flexibles y variadas."
  },
  {
    id: 15,
    question: "¿Qué es la 'programación funcional'?",
    options: [
      "Programar solo funciones matemáticas",
      "Un paradigma que trata la computación como evaluación de funciones matemáticas",
      "Programar sin usar variables",
      "Un tipo de lenguaje de programación"
    ],
    correct: 1,
    explanation: "La programación funcional es un paradigma que enfatiza el uso de funciones puras, inmutabilidad y evita efectos secundarios."
  }
];

function ProgrammingQuizApp() {
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [answers, setAnswers] = useState({});
  const [showResults, setShowResults] = useState(false);
  const [timeElapsed, setTimeElapsed] = useState(0);
  const [startTime, setStartTime] = useState(Date.now());

  useEffect(() => {
    const timer = setInterval(() => {
      setTimeElapsed(Math.floor((Date.now() - startTime) / 1000));
    }, 1000);
    return () => clearInterval(timer);
  }, [startTime]);

  const handleAnswerSelect = (answerIndex) => {
    setAnswers((prev) => ({
      ...prev,
      [currentQuestion]: answerIndex,
    }));
  };

  const calculateScore = () => {
    let correct = 0;
    questions.forEach((question, index) => {
      if (answers[index] === question.correct) {
        correct++;
      }
    });
    return correct;
  };

  const resetQuiz = () => {
    setCurrentQuestion(0);
    setAnswers({});
    setShowResults(false);
    setTimeElapsed(0);
    setStartTime(Date.now());
  };

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs.toString().padStart(2, "0")}`;
  };

  const getProgressColor = () => {
    const answered = Object.keys(answers).length;
    const percentage = (answered / questions.length) * 100;
    if (percentage < 33) return "bg-red-500";
    if (percentage < 66) return "bg-yellow-500";
    return "bg-green-500";
  };

  if (showResults) {
    const score = calculateScore();
    const percentage = Math.round((score / questions.length) * 100);

    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 p-4">
        <div className="max-w-4xl mx-auto">
          <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20">
            <div className="text-center mb-8">
              <h1 className="text-4xl font-bold text-white mb-2">¡Examen Completado!</h1>
              <div className="flex items-center justify-center gap-2 text-white/80">
                <Clock className="w-5 h-5" />
                <span>Tiempo total: {formatTime(timeElapsed)}</span>
              </div>
            </div>

            <div className="bg-white/5 rounded-2xl p-8 mb-8">
              <div className="text-center mb-6">
                <div className="text-6xl font-bold text-white mb-2">{percentage}%</div>
                <div className="text-xl text-white/80">
                  {score} de {questions.length} respuestas correctas
                </div>
              </div>

              <div className="w-full bg-white/20 rounded-full h-4 mb-4">
                <div
                  className={`h-4 rounded-full transition-all duration-1000 ${
                    percentage >= 70
                      ? "bg-green-500"
                      : percentage >= 50
                      ? "bg-yellow-500"
                      : "bg-red-500"
                  }`}
                  style={{ width: `${percentage}%` }}
                />
              </div>

              <div className="text-center text-white/80">
                {percentage >= 70
                  ? "¡Excelente trabajo! 🎉"
                  : percentage >= 50
                  ? "Buen esfuerzo, puedes mejorar 📚"
                  : "Necesitas estudiar más 💪"}
              </div>
            </div>

            <div className="space-y-4 mb-8">
              {questions.map((question, index) => {
                const userAnswer = answers[index];
                const isCorrect = userAnswer === question.correct;

                return (
                  <div
                    key={question.id}
                    className="bg-white/5 rounded-xl p-4 border border-white/10"
                  >
                    <div className="flex items-start gap-3">
                      {isCorrect ? (
                        <CheckCircle className="w-6 h-6 text-green-400 mt-1 flex-shrink-0" />
                      ) : (
                        <XCircle className="w-6 h-6 text-red-400 mt-1 flex-shrink-0" />
                      )}
                      <div className="flex-1">
                        <h3 className="text-white font-semibold mb-2">
                          {index + 1}. {question.question}
                        </h3>
                        <div className="space-y-1 text-sm">
                          <div className="text-green-400">
                            ✓ Correcta: {question.options[question.correct]}
                          </div>
                          {userAnswer !== undefined && userAnswer !== question.correct && (
                            <div className="text-red-400">
                              ✗ Tu respuesta: {question.options[userAnswer]}
                            </div>
                          )}
                          {userAnswer === undefined && (
                            <div className="text-yellow-400">⚠ No respondida</div>
                          )}
                        </div>
                        <div className="mt-2 text-white/70 text-sm">
                          💡 {question.explanation}
                        </div>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>

            <div className="text-center">
              <button
                onClick={resetQuiz}
                className="inline-flex items-center gap-2 bg-gradient-to-r from-purple-600 to-blue-600 hover:from-purple-700 hover:to-blue-700 text-white px-8 py-3 rounded-xl font-semibold transition-all duration-200 transform hover:scale-105"
              >
                <RotateCcw className="w-5 h-5" /> Intentar de Nuevo
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }

  const question = questions[currentQuestion];
  const answeredCount = Object.keys(answers).length;
  const progressPercentage = (answeredCount / questions.length) * 100;

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 p-4">
      <div className="max-w-4xl mx-auto">
        {/* Header */}
        <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-6 shadow-2xl border border-white/20 mb-6">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-3">
              <BookOpen className="w-8 h-8 text-white" />
              <h1 className="text-2xl font-bold text-white">Examen de Programación</h1>
            </div>
            <div className="flex items-center gap-4 text-white/80">
              <div className="flex items-center gap-2">
                <Clock className="w-5 h-5" />
                <span className="font-mono">{formatTime(timeElapsed)}</span>
              </div>
              <div className="text-sm">
                {currentQuestion + 1} / {questions.length}
              </div>
            </div>
          </div>

          {/* Progress Bar */}
          <div className="w-full bg-white/20 rounded-full h-3">
            <div
              className={`h-3 rounded-full transition-all duration-300 ${getProgressColor()}`}
              style={{ width: `${progressPercentage}%` }}
            />
          </div>
          <div className="text-center text-white/60 text-sm mt-2">
            {answeredCount} de {questions.length} preguntas respondidas
          </div>
        </div>

        {/* Question */}
        <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 shadow-2xl border border-white/20 mb-6">
          <div className="mb-6">
            <div className="text-purple-300 text-sm font-semibold mb-2">
              Pregunta {currentQuestion + 1} de {questions.length}
            </div>
            <h2 className="text-2xl font-bold text-white leading-relaxed">
              {question.question}
            </h2>
          </div>

          <div className="space-y-3">
            {question.options.map((option, index) => (
              <button
                key={index}
                onClick={() => handleAnswerSelect(index)}
                className={`w-full p-4 rounded-xl text-left transition-all duration-200 border-2 ${
                  answers[currentQuestion] === index
                    ? "bg-purple-600/50 border-purple-400 text-white"
                    : "bg-white/5 border-white/20 text-white/90 hover:bg-white/10 hover:border-white/40"
                }`}
              >
                <div className="flex items-center gap-3">
                  <div
                    className={`w-6 h-6 rounded-full border-2 flex items-center justify-center text-sm font-bold ${
                      answers[currentQuestion] === index
                        ? "bg-purple-500 border-purple-400 text-white"
                        : "border-white/40 text-white/60"
                    }`}
                  >
                    {String.fromCharCode(65 + index)}
                  </div>
                  <span className="flex-1">{option}</span>
                </div>
              </button>
            ))}
          </div>
        </div>

        {/* Navigation */}
        <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-6 shadow-2xl border border-white/20">
          <div className="flex items-center justify-between">
            <button
              onClick={() => setCurrentQuestion(Math.max(0, currentQuestion - 1))}
              disabled={currentQuestion === 0}
              className="flex items-center gap-2 px-6 py-3 bg-white/10 hover:bg-white/20 disabled:bg-white/5 disabled:text-white/40 text-white rounded-xl transition-all duration-200 disabled:cursor-not-allowed"
            >
              <ChevronLeft className="w-5 h-5" /> Anterior
            </button>

            <div className="flex gap-2 max-w-md overflow-x-auto">
              {questions.map((_, index) => (
                <button
                  key={index}
                  onClick={() => setCurrentQuestion(index)}
                  className={`w-10 h-10 rounded-lg font-semibold transition-all duration-200 flex-shrink-0 ${
                    index === currentQuestion
                      ? "bg-purple-600 text-white"
                      : answers[index] !== undefined
                      ? "bg-green-600 text-white"
                      : "bg-white/20 text-white/60 hover:bg-white/30"
                  }`}
                >
                  {index + 1}
                </button>
              ))}
            </div>

            {currentQuestion === questions.length - 1 ? (
              <button
                onClick={() => setShowResults(true)}
                className="flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-green-600 to-emerald-600 hover:from-green-700 hover:to-emerald-700 text-white rounded-xl font-semibold transition-all duration-200 transform hover:scale-105"
              >
                Finalizar Examen
                <CheckCircle className="w-5 h-5" />
              </button>
            ) : (
              <button
                onClick={() =>
                  setCurrentQuestion(Math.min(questions.length - 1, currentQuestion + 1))
                }
                className="flex items-center gap-2 px-6 py-3 bg-white/10 hover:bg-white/20 text-white rounded-xl transition-all duration-200"
              >
                Siguiente
                <ChevronRight className="w-5 h-5" />
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
const root = createRoot(document.getElementById("root"));
root.render(<ProgrammingQuizApp />);
